//
//  ButtonActionHandler.swift
//  codeongo
//
//  Created by Gulshan Khandale  on 15/04/25.
//


import Foundation
import SwiftUI
import Stripe
import StripePaymentSheet

class FeatureButtonActionHandler: ObservableObject {
    @Published var alertMessage: String = ""
    @Published var showAlert: Bool = false

    private var paymentSheet: PaymentSheet?

    func makePayment() {
        guard let url = URL(string: "https://api.aipocdev.ilserver.cloud/api/v1/payment/create-payment-intent") else {
            alertMessage = "Invalid backend URL."
            showAlert = true
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        
        let body: [String: Any] = [
            "amount": 1099,
            "currency": "usd"
        ]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
        } catch {
            alertMessage = "Failed to encode request."
            showAlert = true
            return
        }

        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                guard let self = self else { return }

                if let error = error {
                    self.alertMessage = "Request error: \(error.localizedDescription)"
                    self.showAlert = true
                    return
                }

                guard let data = data,
                      let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                      let clientSecret = json["clientSecret"] as? String else {
                    self.alertMessage = "Failed to get payment info."
                    self.showAlert = true
                    return
                }

                var config = PaymentSheet.Configuration()
                config.merchantDisplayName = "AI POC"

                self.paymentSheet = PaymentSheet(paymentIntentClientSecret: clientSecret, configuration: config)
                self.presentPaymentSheet()
            }
        }.resume()
    }

    private func presentPaymentSheet() {
        guard let paymentSheet = paymentSheet,
              let rootVC = UIApplication.shared.connectedScenes
                .compactMap({ $0 as? UIWindowScene })
                .first?.windows.first(where: { $0.isKeyWindow })?.rootViewController else {
            alertMessage = "Cannot present payment sheet."
            showAlert = true
            return
        }

        paymentSheet.present(from: rootVC) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }

                switch result {
                case .completed:
                    self.alertMessage = "Payment successful!"
                case .canceled:
                    self.alertMessage = "Payment canceled."
                case .failed(let error):
                    self.alertMessage = "Payment failed: \(error.localizedDescription)"
                }
                self.showAlert = true
            }
        }
    }
    
    func sendEmail() {
        
        let email:String = "myemail@gmail.com";
        let subject: String = "Test Subject";
        let message: String = "Test Message";
        
        guard let url = URL(string: "https://api.aipocdev.ilserver.cloud/api/v1/notification/send-email") else {
                alertMessage = "Invalid email API URL."
                showAlert = true
                return
            }

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            let body: [String: Any] = [
                "to": email,
                "subject": subject,
                "message": message
            ]

            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: body)
            } catch {
                alertMessage = "Failed to encode email request."
                showAlert = true
                return
            }
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
              DispatchQueue.main.async {
                  guard let self = self else { return }

                  if let error = error {
                      self.alertMessage = "Email request error: \(error.localizedDescription)"
                      self.showAlert = true
                      return
                  }

                  guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                      self.alertMessage = "Failed to send email."
                      self.showAlert = true
                      return
                  }

                  self.alertMessage = "Email sent successfully!"
                  self.showAlert = true
              }
          }.resume()
    }
}


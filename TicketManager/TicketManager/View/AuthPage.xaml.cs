using Microsoft.UI.Xaml;
using Microsoft.UI.Xaml.Controls;
using Microsoft.UI.Xaml.Controls.Primitives;
using Microsoft.UI.Xaml.Data;
using Microsoft.UI.Xaml.Input;
using Microsoft.UI.Xaml.Media;
using Microsoft.UI.Xaml.Navigation;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using Windows.Foundation;
using Windows.Foundation.Collections;

namespace TicketManager.View
{
    public sealed partial class AuthPage : Page
    {
        private bool isLoginMode = true;

        public AuthPage()
        {
            this.InitializeComponent();
        }

        private void ActionButton_Click(object sender, RoutedEventArgs e)
        {
            if (isLoginMode)
            {
                // Login action
                // Navigate to search
                this.Frame.Navigate(typeof(FlightSearchPage));
            }
            else
            {
                // Register action
                // Could automatically login or just switch back to login mode
                this.Frame.Navigate(typeof(FlightSearchPage));
            }
        }

        private void ToggleMode_Click(object sender, RoutedEventArgs e)
        {
            isLoginMode = !isLoginMode;

            if (isLoginMode)
            {
                TitleTextBlock.Text = "Welcome to WizzErr";
                SubtitleTextBlock.Text = "Please sign in to manage your tickets";
                loginButton.Content = "Sign In";
                TogglePromptText.Text = "Don't have an account?";
                ToggleModeButton.Content = "Create one";
                usernameInput.Visibility = Visibility.Collapsed;
                phoneInput.Visibility = Visibility.Collapsed;
            }
            else
            {
                TitleTextBlock.Text = "Create a WizzErr Account";
                SubtitleTextBlock.Text = "Fill in the details to register";
                loginButton.Content = "Register";
                TogglePromptText.Text = "Already have an account?";
                ToggleModeButton.Content = "Sign in";
                usernameInput.Visibility = Visibility.Visible;
                phoneInput.Visibility = Visibility.Visible;
            }

            ValidateInput();
        }

        private void Input_TextChanged(object sender, TextChangedEventArgs e)
        {
            ValidateInput();
        }

        private void Password_PasswordChanged(object sender, RoutedEventArgs e)
        {
            ValidateInput();
        }

        private void ValidateInput()
        {
            if (loginButton == null) return;

            if (isLoginMode)
            {
                loginButton.IsEnabled = !string.IsNullOrWhiteSpace(emailInput.Text) &&
                                        !string.IsNullOrWhiteSpace(passwordInput.Password);
            }
            else
            {
                loginButton.IsEnabled = !string.IsNullOrWhiteSpace(emailInput.Text) &&
                                        !string.IsNullOrWhiteSpace(usernameInput.Text) &&
                                        !string.IsNullOrWhiteSpace(phoneInput.Text) &&
                                        !string.IsNullOrWhiteSpace(passwordInput.Password);
            }
        }
    }
}

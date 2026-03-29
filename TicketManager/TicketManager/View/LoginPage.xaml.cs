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
    public sealed partial class LoginPage : Page
    {
        public LoginPage()
        {
            this.InitializeComponent();
        }

        private void SignInButton_Click(object sender, RoutedEventArgs e)
        {
            // Te trimite la search-ul colegului tău
            this.Frame.Navigate(typeof(SearchPage));
        }

        private void CreateAccount_Click(object sender, RoutedEventArgs e)
        {
            // Te trimite la pagina de Register
            this.Frame.Navigate(typeof(RegisterPage));
        }
    }
}

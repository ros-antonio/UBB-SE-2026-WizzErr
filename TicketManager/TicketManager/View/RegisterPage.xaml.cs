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
using TicketManager.View;
using Windows.Foundation;
using Windows.Foundation.Collections;

namespace TicketManager.View
{
    public sealed partial class RegisterPage : Page
    {
        public RegisterPage()
        {
            this.InitializeComponent();
        }

        private void RegisterButton_Click(object sender, RoutedEventArgs e)
        {
            // După ce se înregistrează, îl trimitem înapoi la Login
            // (Aici va veni mai târziu logica de DB scrisă de voi)
            this.Frame.Navigate(typeof(LoginPage));
        }

        private void BackToLogin_Click(object sender, RoutedEventArgs e)
        {
            // Revine pur și simplu la pagina anterioară din istoric
            if (this.Frame.CanGoBack)
            {
                this.Frame.GoBack();
            }
        }
    }
}

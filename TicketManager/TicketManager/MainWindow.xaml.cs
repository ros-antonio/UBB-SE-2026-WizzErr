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

namespace TicketManager
{
    public sealed partial class MainWindow : Window
    {
        public MainWindow()
        {
            this.InitializeComponent();

            // 1. Abonăm Frame-ul la evenimentul de navigare
            ContentFrame.Navigated += ContentFrame_Navigated;

            NavigateTo(typeof(View.LoginPage));
            TopNav.SelectedItem = null;
        }

        public void NavigateTo(Type pageType)
        {
            if (ContentFrame.CurrentSourcePageType != pageType)
            {
                ContentFrame.Navigate(pageType);
            }
        }

        // 2. Funcția care pune liniuța pe butonul corect automat
        private void ContentFrame_Navigated(object sender, NavigationEventArgs e)
        {
            if (TopNav == null || TopNav.MenuItems == null) return;

            bool itemFound = false;

            // Luăm doar numele paginii (ex: "SearchPage" în loc de "TicketManager.view.SearchPage")
            string pageName = e.SourcePageType.Name;

            foreach (NavigationViewItem item in TopNav.MenuItems)
            {
                // Acum verificăm doar dacă Tag-ul SE TERMINĂ cu numele paginii. 
                // Așa ignorăm complet problemele cu litere mari/mici de la folderul "view".
                if (item.Tag != null && item.Tag.ToString().EndsWith(pageName, StringComparison.OrdinalIgnoreCase))
                {
                    TopNav.SelectedItem = item;
                    itemFound = true;
                    break;
                }
            }

            // Dacă suntem la Login sau Register, scoatem selecția de pe meniu
            if (!itemFound)
            {
                TopNav.SelectedItem = null;
            }
        }

        private void TopNav_ItemInvoked(NavigationView sender, NavigationViewItemInvokedEventArgs args)
        {
            if (args.IsSettingsInvoked)
            {
                return;
            }

            var navItemTag = args.InvokedItemContainer?.Tag?.ToString();
            if (!string.IsNullOrEmpty(navItemTag))
            {
                Type pageType = Type.GetType(navItemTag);
                if (pageType != null)
                {
                    NavigateTo(pageType);
                }
            }
        }

        private void TopNav_BackRequested(NavigationView sender, NavigationViewBackRequestedEventArgs args)
        {
            if (ContentFrame.CanGoBack)
            {
                ContentFrame.GoBack();
            }
        }
    }
}
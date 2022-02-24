import SwiftUI
import Combine

struct CountryListView: View {
    @ObservedObject var viewModel: CountryListViewModel
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                CountryListLoadingView()
            case .error(let title, let message):
                CountryListErrorView(
                    title: title,
                    message: message
                )
            case .list(let items):
                CountryListViewList(
                    countries: items,
                    onCountrySelection: viewModel.didTapAt(country:)
                )
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}

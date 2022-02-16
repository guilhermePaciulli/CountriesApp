import SwiftUI
import Combine

struct CountryListView: View {
    @ObservedObject var viewModel: CountryListViewModel
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .loading:
                CountryListLoadingView()
            case .error(let title, let message):
                CountryListErrorView(
                    title: title,
                    message: message
                )
            case .list(let items):
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(items) { item in
                            HStack {
                                Text(item.name.common)
                                Spacer()
                                Image(systemName: "chevron.right")
                            }.padding(.leading, 20)
                            .padding(.trailing, 20)
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}

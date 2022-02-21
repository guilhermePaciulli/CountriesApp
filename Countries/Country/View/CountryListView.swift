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

struct ScrollableStackView<Content: View>: View {
    var content: Content
    var showsIndicators: Bool
    var alignment: HorizontalAlignment
    var spacing: CGFloat?
    
    init(
        showsIndicators: Bool = true,
        alignment: HorizontalAlignment = .center,
        spacing: CGFloat? = nil,
        @ViewBuilder content: () -> Content
    ) {
        self.showsIndicators = showsIndicators
        self.alignment = alignment
        self.spacing = spacing
        self.content = content()
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: showsIndicators) {
            VStack(alignment: alignment, spacing: spacing) {
                content
            }
        }
    }
}

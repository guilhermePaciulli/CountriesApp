import SwiftUI

extension CountryListView {
    struct CountryListLoadingView: View {
        var body: some View {
            VStack {
                LoadingAnimationView()
                    .padding(.top, 24)
                    .padding(.leading, 36)
                    .padding(.trailing, 36)
                    .scaledToFit()
                Spacer()
            }
        }
    }
}

struct CountryListViewLoading_Preview: PreviewProvider {
    static var previews: some View {
        CountryListView.CountryListLoadingView()
    }
}

import SwiftUI

extension CountryListView {
    struct CountryListErrorView: View {
        let title: String
        let message: String
        var body: some View {
            VStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.ctyRawSienna)
                    .scaledToFit()
                    
                Text(title)
                    .font(.title)
                Text(message)
                Spacer()
            }
        }
    }
}

struct CountryListViewError_Preview: PreviewProvider {
    static var previews: some View {
        CountryListView.CountryListErrorView(
            title: "Ops...",
            message: "There was an error"
        )
    }
}

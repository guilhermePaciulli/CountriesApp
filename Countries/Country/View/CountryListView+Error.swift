import SwiftUI

extension CountryListView {
    struct CountryListErrorView: View {
        let title: String
        let message: String
        var body: some View {
            VStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                    .foregroundColor(.ctyRawSienna)
                Text(title)
                    .foregroundColor(.ctyGunMetal)
                    .font(.ctyHeadline)
                Text(message)
                    .foregroundColor(.ctyGunMetal)
                    .font(.ctyText)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 3)
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

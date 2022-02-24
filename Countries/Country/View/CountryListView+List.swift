import SwiftUI

extension CountryListView {
    struct CountryListViewList: View {
        let countries: [Country]
        let onCountrySelection: (Country) -> ()
        var body: some View {
            ScrollView {
                ForEach(countries) { item in
                    HStack {
                        Text(item.emojiFlag ?? "📍")
                            .font(.ctySubtitle)
                        Text(item.name.common)
                            .font(.ctySubtitle)
                        Spacer()
                        Image(systemName: "info.circle")
                            .foregroundColor(.ctyRawSienna)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 3)
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                }
            }
        }
    }
}

struct CountryListViewList_Preview: PreviewProvider {
    static var previews: some View {
        CountryListView.CountryListViewList(
            countries: mockedObject(
                fileName: "CountriesMock"
            ),
            onCountrySelection: { _ in
                
            }
        )
    }
}

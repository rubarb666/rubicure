describe Rubicure::Series do
  describe "#names" do
    subject{ Rubicure::Series.names }

    where(:series_name) do
      [
          [:unmarked],
          [:max_heart],
          [:splash_star],
          [:yes],
          [:yes_gogo],
          [:flesh],
          [:heart_catch],
          [:suite],
          [:smile],
          [:dokidoki],
          [:happiness_charge],
      ]
    end

    with_them do
      it{ should include series_name }
    end
  end

  describe "#fetch" do
    subject{ Rubicure::Series.fetch(series_name) }

    context "when exists" do
      let(:series_name){ :smile }

      describe "fetched properties" do
        let(:series){ Rubicure::Series.fetch(series_name) }

        it{ expect(series.title).to eq "スマイルプリキュア！" }
      end
    end

    context "when not exists" do
      let(:series_name){ :ashita_no_nadja  }

      it{ expect{subject}.to raise_error }
    end
  end
end

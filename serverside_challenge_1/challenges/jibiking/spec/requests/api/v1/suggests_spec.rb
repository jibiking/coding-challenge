require 'rails_helper'
require 'support/suggest_helper'

RSpec.describe 'Suggests', type: :request do
  describe 'GET /api/v1/suggests' do
    let(:body){ JSON.parse(response.body) }
    let(:path){ "/api/v1/suggests?A=#{amp}&kWh=#{kwh}" }

    before do
      # テストデータの挿入
      post '/api/v1/providers', params: {file: fixture_file_upload('providers.csv')}
      post '/api/v1/plans', params: {file: fixture_file_upload('plans.csv')}
      post '/api/v1/amperages', params: {file: fixture_file_upload('amperages.csv')}
      post '/api/v1/kilowattos', params: {file: fixture_file_upload('kilowattos.csv')}
    end


    describe '成功' do
      describe 'A数変更時の動作確認' do
        # kWhは10kWhで固定
        let(:kwh){ 10 }

        context '10Aの場合' do
          let(:amp){ 10 }
          it '正しいプラン情報が取得できる' do
            get path

            expect(response).to be_successful
            expect(body).to eq([
              {
                  "provider_name"=>"東京電力エナジーパートナー",
                  "plan_name"=>"従量電灯B",
                  "price"=>485
              },
              {
                  "provider_name"=>"Loopでんき",
                  "plan_name"=>"おうちプラン",
                  "price"=>264
              }
          ])
          end
        end

        context '15Aの場合' do
          let(:amp){ 15 }
          it '正しいプラン情報が取得できる' do
            get path

            expect(response).to be_successful
            expect(body).to eq([
              {
                  "provider_name"=>"東京電力エナジーパートナー",
                  "plan_name"=>"従量電灯B",
                  "price"=>628
              }
          ])
          end
        end

        context '20Aの場合' do
          let(:amp){ 20 }
          it '正しいプラン情報が取得できる' do
            get path

            expect(response).to be_successful
            expect(body).to eq([
              {
                  "provider_name"=>"東京電力エナジーパートナー",
                  "plan_name"=>"従量電灯B",
                  "price"=>771
              },
              {
                  "provider_name"=>"Loopでんき",
                  "plan_name"=>"おうちプラン",
                  "price"=>264
              }
          ])
          end
        end

        context '30Aの場合' do
          let(:amp){ 30 }
          it '正しいプラン情報が取得できる' do
            get path

            expect(response).to be_successful
            expect(body).to eq([
              {
                  "provider_name"=>"東京電力エナジーパートナー",
                  "plan_name"=>"従量電灯B",
                  "price"=>1057
              },
              {
                  "provider_name"=>"Loopでんき",
                  "plan_name"=>"おうちプラン",
                  "price"=>264
              },
              {
                  "provider_name"=>"東京ガス",
                  "plan_name"=>"ずっとも電気1",
                  "price"=>1095
              },
              {
                  "provider_name"=>"JXTGでんき",
                  "plan_name"=>"従量電灯Bたっぷりプラン",
                  "price"=>1057
              }
          ])
          end
        end

        context '40Aの場合' do
          let(:amp){ 40 }
          it '正しいプラン情報が取得できる' do
            get path

            expect(response).to be_successful
            expect(body).to eq([
              {
                  "provider_name"=>"東京電力エナジーパートナー",
                  "plan_name"=>"従量電灯B",
                  "price"=>1343
              },
              {
                  "provider_name"=>"Loopでんき",
                  "plan_name"=>"おうちプラン",
                  "price"=>264
              },
              {
                  "provider_name"=>"東京ガス",
                  "plan_name"=>"ずっとも電気1",
                  "price"=>1381
              },
              {
                  "provider_name"=>"JXTGでんき",
                  "plan_name"=>"従量電灯Bたっぷりプラン",
                  "price"=>1343
              }
          ])
          end
        end

        context '50Aの場合' do
          let(:amp){ 50 }
          it '正しいプラン情報が取得できる' do
            get path

            expect(response).to be_successful
            expect(body).to eq([
              {
                  "provider_name"=>"東京電力エナジーパートナー",
                  "plan_name"=>"従量電灯B",
                  "price"=>1629
              },
              {
                  "provider_name"=>"Loopでんき",
                  "plan_name"=>"おうちプラン",
                  "price"=>264
              },
              {
                  "provider_name"=>"東京ガス",
                  "plan_name"=>"ずっとも電気1",
                  "price"=>1667
              },
              {
                  "provider_name"=>"JXTGでんき",
                  "plan_name"=>"従量電灯Bたっぷりプラン",
                  "price"=>1629
              }
          ])
          end
        end

        context '60Aの場合' do
          let(:amp){ 60 }
          it '正しいプラン情報が取得できる' do
            get path

            expect(response).to be_successful
            expect(body).to eq([
              {
                  "provider_name"=>"東京電力エナジーパートナー",
                  "plan_name"=>"従量電灯B",
                  "price"=>1915
              },
              {
                  "provider_name"=>"Loopでんき",
                  "plan_name"=>"おうちプラン",
                  "price"=>264
              },
              {
                  "provider_name"=>"東京ガス",
                  "plan_name"=>"ずっとも電気1",
                  "price"=>1953
              },
              {
                  "provider_name"=>"JXTGでんき",
                  "plan_name"=>"従量電灯Bたっぷりプラン",
                  "price"=>1915
              }
          ])
          end
        end
      end

      describe 'kWh数変更時の動作確認' do
        # Aは30Aで固定
        let(:amp){ 30 }

        context '120kWhの場合' do
          let(:kwh){ 120 }
          it '正しいプラン情報が取得できる' do
            get path
            
            expect(response).to be_successful
            expect(body).to eq([
              {
                  "provider_name"=>"東京電力エナジーパートナー",
                  "plan_name"=>"従量電灯B",
                  "price"=>3244
              },
              {
                  "provider_name"=>"Loopでんき",
                  "plan_name"=>"おうちプラン",
                  "price"=>3168
              },
              {
                  "provider_name"=>"東京ガス",
                  "plan_name"=>"ずっとも電気1",
                  "price"=>3698
              },
              {
                  "provider_name"=>"JXTGでんき",
                  "plan_name"=>"従量電灯Bたっぷりプラン",
                  "price"=>3244
              }
          ])
          end
        end

        context '140kWhの場合' do
          let(:kwh){ 140 }
          it '正しいプラン情報が取得できる' do
            get path
            
            expect(response).to be_successful
            expect(body).to eq([
              {
                  "provider_name"=>"東京電力エナジーパートナー",
                  "plan_name"=>"従量電灯B",
                  "price"=>4565
              },
              {
                  "provider_name"=>"Loopでんき",
                  "plan_name"=>"おうちプラン",
                  "price"=>3696
              },
              {
                  "provider_name"=>"東京ガス",
                  "plan_name"=>"ずっとも電気1",
                  "price"=>4172
              },
              {
                  "provider_name"=>"JXTGでんき",
                  "plan_name"=>"従量電灯Bたっぷりプラン",
                  "price"=>4565
              }
          ])
          end
        end

        context '300kWhの場合' do
          let(:kwh){ 300 }
          it '正しいプラン情報が取得できる' do
            get path
            
            expect(response).to be_successful
            expect(body).to eq([
              {
                  "provider_name"=>"東京電力エナジーパートナー",
                  "plan_name"=>"従量電灯B",
                  "price"=>8802
              },
              {
                  "provider_name"=>"Loopでんき",
                  "plan_name"=>"おうちプラン",
                  "price"=>7920
              },
              {
                  "provider_name"=>"東京ガス",
                  "plan_name"=>"ずっとも電気1",
                  "price"=>8022
              },
              {
                  "provider_name"=>"JXTGでんき",
                  "plan_name"=>"従量電灯Bたっぷりプラン",
                  "price"=>8802
              }
          ])
          end
        end

        context '350kWhの場合' do
          let(:kwh){ 350 }
          it '正しいプラン情報が取得できる' do
            get path
            
            expect(response).to be_successful
            expect(body).to eq([
              {
                  "provider_name"=>"東京電力エナジーパートナー",
                  "plan_name"=>"従量電灯B",
                  "price"=>11558
              },
              {
                  "provider_name"=>"Loopでんき",
                  "plan_name"=>"おうちプラン",
                  "price"=>9240
              },
              {
                  "provider_name"=>"東京ガス",
                  "plan_name"=>"ずっとも電気1",
                  "price"=>9216
              },
              {
                  "provider_name"=>"JXTGでんき",
                  "plan_name"=>"従量電灯Bたっぷりプラン",
                  "price"=>9636
              }
          ])
          end
        end

        context '600kWhの場合' do
          let(:kwh){ 600 }
          it '正しいプラン情報が取得できる' do
            get path
            
            expect(response).to be_successful
            expect(body).to eq([
              {
                  "provider_name"=>"東京電力エナジーパートナー",
                  "plan_name"=>"従量電灯B",
                  "price"=>19200
              },
              {
                  "provider_name"=>"Loopでんき",
                  "plan_name"=>"おうちプラン",
                  "price"=>15840
              },
              {
                  "provider_name"=>"東京ガス",
                  "plan_name"=>"ずっとも電気1",
                  "price"=>16704
              },
              {
                  "provider_name"=>"JXTGでんき",
                  "plan_name"=>"従量電灯Bたっぷりプラン",
                  "price"=>15906
              }
          ])
          end
        end

        context '650kWhの場合' do
          let(:kwh){ 650 }
          it '正しいプラン情報が取得できる' do
            get path
            
            expect(response).to be_successful
            expect(body).to eq([
              {
                  "provider_name"=>"東京電力エナジーパートナー",
                  "plan_name"=>"従量電灯B",
                  "price"=>20729
              },
              {
                  "provider_name"=>"Loopでんき",
                  "plan_name"=>"おうちプラン",
                  "price"=>17160
              },
              {
                  "provider_name"=>"東京ガス",
                  "plan_name"=>"ずっとも電気1",
                  "price"=>18025
              },
              {
                  "provider_name"=>"JXTGでんき",
                  "plan_name"=>"従量電灯Bたっぷりプラン",
                  "price"=>17856
              }
          ])
          end
        end

      end
    end

    describe '失敗' do
      describe 'A数誤入力時の動作確認' do
        # kWhは10kWhで固定
        let(:kwh){ 10 }

        context '予期しないA数（指定外）が入力された場合' do
          let(:amp){ 5 }
          include_examples 'Aのエラーメッセージを返す'
        end

        context '予期しないA数（マイナス）が入力された場合' do
          let(:amp){ -30 }
          include_examples 'Aのエラーメッセージを返す'
        end

        context '予期しないA数（小数点）が入力された場合' do
          let(:amp){ 0.5 }
          include_examples 'Aのエラーメッセージを返す'
        end

        context '文字列が入力された場合' do
          let(:amp){ 'test' }
          include_examples 'Aのエラーメッセージを返す'
        end

        context 'Aが入力されなかった場合' do
          let(:amp){ '' }
          include_examples 'Aのエラーメッセージを返す'
        end
      end

      describe 'kWh誤入力時の動作確認' do
        # Aは30Aで固定
        let(:amp){ 30 }

        context '予期しないkWh数（マイナス）が入力された場合' do
          let(:kwh){ -100 }
          include_examples 'kWhのエラーメッセージを返す'
        end

        context '予期しないkWh数（小数点）が入力された場合' do
          let(:kwh){ 0.5 }
          include_examples 'kWhのエラーメッセージを返す'
        end

        context '文字列が入力された場合' do
          let(:kwh){ 'test' }
          include_examples 'kWhのエラーメッセージを返す'
        end

        context 'kWhが入力されなかった場合' do
          let(:kwh){ '' }
          include_examples 'kWhのエラーメッセージを返す'
        end
      end
    end
  end
end

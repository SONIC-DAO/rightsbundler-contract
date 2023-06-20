# Rights Bundler
by SONIC DAO

<img width="585" alt="image" src="https://github.com/SONIC-DAO/rightsbundler-contract/assets/29562675/6ed2e928-6877-4b7a-adc3-a274e0d56aee">

### What it does
「Rights Bundler」は、ERC6551規格を使用してクリエイターNFT、著作権NFT、および契約NFTを束ね、無形資産の取引と管理を効率化します。権利元NFTの移転時に紐づくNFTも一緒に移転され、無形資産の証明が容易になり、価値が定量化されます。


### クリエイターが直面しうる無形資産に関するペイン


保護と利益の困難性：無形資産はその性質上、複製や盗用が容易。また、それを防ぐことが難しい。特許や著作権などの法的手段を用いて保護を試みることも可能だが、これには高いコストと時間が必要になる。評価とマネタイズの難しさ：無形資産の価値は主観的で、それがいくらで取引されるべきかを決定することは困難。また、その価値を直接金銭的に換金する手段が確立されていない場合も多い。このため、クリエイターは自身の作品やアイデアの真の価値を得ることが難しい状況になっている。パブリックドメインとの関係：クリエイターの作品が広く共有され、パブリックドメインになることは一般的には良いことのように見える。しかし、その結果としてクリエイターが経済的な報酬を得る機会を失うことが多くある。デジタルプラットフォームのパワーバランス：音楽、映画、アートなどの無形資産は、今日では主にデジタルプラットフォームを通じて配布・販売される。しかし、これらのプラットフォームはクリエイターよりもプラットフォーム運営者に利益をもたらしてしまうという現状がある、クリエイターが適切な報酬を受け取れない状況を生み出してしまっていることはクリエイター目線ではペイン。

このようなペインをRights Bundlerは解決します。



### 市場規模拡大から示唆される無形資産投資の重要性

Elsten and Hill によると米国の代表的な株価指数であるS&P500に採用されている企業の市場価値を要因分解すると、2015年時点で84％が無形資産であり、欧州のS&P Europe350に採用されている企業の市場価値は71％が無形資産としている。これはクリエイティブな分野に限らず様々な分野での定量値ではあるが、クリエイティブ産業は日本の主要な成長分野としてとらえられており(出典: 日本広告制作協会)、いまや国家戦略の一つにさえ位置づけていると言えます。 その市場規模は約12兆円で米国に次ぐ世界第2位であり、これらの要因を加味すると無形資産に関する市場は今後もっと伸びると考えられ、そういったリソースをクリエイターが十分に享受できることを目的としています。


### The problem it solves
クリエイターにとって価値評価の困難さ、パブリックドメインとの微妙な関係等の問題を解消します。これにより、自分の作品のコントロールを回復し、その価値を適切に認識されることができます。さらに、このアプローチはクリエイターに限定されず、不動産など他の業界でも適用可能です。これは無形資産の価値が急速に高まりを見せている現在の潮流において重要であると考えられます。



### Challenges I ran into
ERC6551規格の適用やNFTの連携には技術的な困難が伴いました。また、無形資産の価値を適切に定量化する方法や、関連する契約を効果的に統合するプロセスを確立することも課題でした。



### Technologies I used
AstarブロックチェーンとERC6551規格を使用しました。

また、スマートコントラクト技術を活用して、NFT間の連携と自動化された取引プロセスを実現しました。


### How we built it
ERC6551規格の仕様を深く理解し、Astarブロックチェーン上でのNFTの作成と連携のプロセスを設計しました。

次に、スマートコントラクトを開発し、NFTの移転と紐づく契約の自動化を実現しました。



### What we learned
NFTとブロックチェーンが無形資産の取引と管理に革命をもたらす可能性を学びました。また、技術的な課題を解決する過程で、チームワークと柔軟な思考が重要であることを理解しました。



### What's next for
Rights Bundlerの次のステップは、プロダクトの機能を拡張し、さらなるパートナーシップを確立して、無形資産のNFT市場をさらに活性化させることです。また、ユーザーエクスペリエンスを向上させ、新しい市場や産業への適用を探求することを目指します。これにより、Rights Bundlerは無形資産の取引と管理を全世界で革新する役割を果たすことができます。


## Contracts
Network: Astar

|  Contract Name  |  Contract Address  |
| ---- | ---- |
| CreatorToken | [0xaE831507AB195315A43752DEf3Be98dFa15A8e01](https://blockscout.com/astar/address/0xaE831507AB195315A43752DEf3Be98dFa15A8e01#code) |
| CopyrightToken  | [0xdE7CF8553C6030De173C19Ba211aE2569bed6479](https://blockscout.com/astar/address/0xdE7CF8553C6030De173C19Ba211aE2569bed6479#code) |
| LicenseToken | [0x5C18954AF0B8e52f0Df6d191Fd39a01741B6D46a](https://blockscout.com/astar/address/0x5C18954AF0B8e52f0Df6d191Fd39a01741B6D46a#code) |
| ERC6551Registry | [0x5e206702F539E1af3457d128A6F97E3ba35aEf1E](https://blockscout.com/astar/address/0x5e206702F539E1af3457d128A6F97E3ba35aEf1E#code) |
| TokenBoundAccount | [0x5732aDd22FCB730D8E94483aDa9dD4Bd6797213b](https://blockscout.com/astar/address/0x5732aDd22FCB730D8E94483aDa9dD4Bd6797213b#code) |

## Sample Transactions

|  Action  |  Transaction  |
| ---- | ---- |
| クリエイターNFT発行 | [0x9259bb7354d7adebb6a26e10d6b1f703ca3243ceacb1c72aadc97ca1ba35279e](https://blockscout.com/astar/tx/0x9259bb7354d7adebb6a26e10d6b1f703ca3243ceacb1c72aadc97ca1ba35279e) |
| 著作権NFT発行 | [0x47c619955aca720c3d61f0b02eb1661f956a21edc4bbdef6d1e0fb8dacca72ff](https://blockscout.com/astar/tx/0x47c619955aca720c3d61f0b02eb1661f956a21edc4bbdef6d1e0fb8dacca72ff) |
| ライセンスNFT発行 | [0x7c40b15572ba933deac29959c4a441570ca277391ed8052dec299e36411ebbab](https://blockscout.com/astar/tx/0x7c40b15572ba933deac29959c4a441570ca277391ed8052dec299e36411ebbab) |

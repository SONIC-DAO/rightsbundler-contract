import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import 'dotenv/config'

const PRIVATE_KEY = process.env.PRIVATE_KEY;
const ALCHEMY_ID = process.env.ALCHEMY_ID;
const POLYGONSCAN_API_KEY = process.env.POLYGONSCAN_API_KEY;
const ASTARSCAN_API_KEY = process.env.ASTARSCAN_API_KEY;

const config: HardhatUserConfig = {
    defaultNetwork: "mumbai",
    solidity: {
        compilers: [
            {
                version: "0.8.18",

                settings: {
                    optimizer: { enabled: true, runs: 200 },
                },
            },
        ],
    },
    networks: {
        hardhat: {
            allowUnlimitedContractSize: true,
            forking: {
                url: `https://polygon-mumbai.g.alchemy.com/v2/${ALCHEMY_ID}`
                // blockNumber: 7704180
            },
        },
        astar: {
            url: "https://evm.astar.network",
            chainId: 592,
            accounts: PRIVATE_KEY ? [PRIVATE_KEY] : [],
        },
        mumbai: {
            url: `https://polygon-mumbai.g.alchemy.com/v2/${ALCHEMY_ID}`,
            chainId: 80001,
            accounts: PRIVATE_KEY ? [PRIVATE_KEY] : [],
        },
    },
    etherscan: {
        apiKey: {
            polygonMumbai: POLYGONSCAN_API_KEY ? POLYGONSCAN_API_KEY : "",
            astar: ASTARSCAN_API_KEY ? ASTARSCAN_API_KEY : "",
        }
    },

};

export default config;

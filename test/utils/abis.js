const TradeProxyManager = require('../abis/TradeProxyManager.json')
const MultichainRouter = require('../abis/MultichainRouter.json')
const SushiswapTradeProxy = require('../abis/SushiswapTradeProxy.json')
const AnyswapV6ERC20 = require('../abis/AnyswapV6ERC20.json')
const UniswapV2Factory = require('../abis/UniswapV2Factory.json')
const UniswapV2Pair = require('../abis/UniswapV2Pair.json')
const UniswapV2Router02 = require('../abis/UniswapV2Router02.json')
const WETH9 = require('../abis/WETH9.json')

const ABIS = {
    TradeProxyManager,
    MultichainRouter,
    SushiswapTradeProxy,
    UniswapV2Factory,
    AnyswapV6ERC20,
    UniswapV2Pair,
    UniswapV2Router02,
    WETH9
};

module.exports = ABIS
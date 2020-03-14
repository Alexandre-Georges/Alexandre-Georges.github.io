importScripts('./ww-exports.js')

onmessage = (message) => {
  if (message.data.type === 'get-config') {
    postMessage({ type: 'config', config: genetics.getConfig(message.data.algo) });
  } else if (message.data.type === 'start') {
    genetics.start(message.data.timeout, message.data.algo, message.data.config, state => {
      postMessage({ type: 'new-state', state });
    }, state => {
      postMessage({ type: 'end', state });
    });
  }
}
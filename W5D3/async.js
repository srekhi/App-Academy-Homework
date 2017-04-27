// window.setTimeout(() => alert('HAMMERTIME'), 5000);

function hammerTime(time){
  window.setTimeout(() => alert(`${time} is hammertime`), time);
  // first arg is callback, second is param for time.
}

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

/*
Ask the user if they'd like tea.
console.log their response.
Ask the user if they'd like biscuits.
console.log their complete response: So you ${firstAns} want tea and you ${secondAns} want coffee.
Close the reader.
*/


function teaAndBiscuits() {
  let first, second;
  reader.question("Would you like some tea?", (firstResponse) => {
    first = firstResponse;
    console.log(`Your reply: ${firstResponse}`);

    reader.question("Would you like some biscuits?", (secondResponse) =>{
      second = secondResponse;
      console.log(`Your reply: ${secondResponse}`);

      const firstRes = (first === 'yes') ? 'do' : 'don\'t';
      const secondRes = (second === 'yes') ? 'do' : 'don\'t';
      console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
    });

  });

}

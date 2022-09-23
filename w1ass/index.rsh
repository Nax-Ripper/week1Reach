'reach 0.1'

// code it 1.2
// an object 
const pat_vanna = {
  getChallenge: Fun([], UInt),
  seeResult: Fun([UInt], Null)
}

const creator_Bidder_Buyer = {
  seePrice: Fun([], UInt),
  getDescription: Fun([], BytesDyn)
}


// code it 1.1 
export const main = Reach.App(() => {
  const Pat = Participant('Pat', {
    ...pat_vanna
  })
  const Vanna = Participant('Vanna', {
    ...pat_vanna
  })
  const Creator = Participant('Creator', {})

  const Bidder = Participant('Bidder', {
    ...creator_Bidder_Buyer
  })
  const Buyer = Participant('Buyer', {
    ...creator_Bidder_Buyer
  })

  init()

  // code it 1.3 
  Pat.only(() => {
    // 1.4 , 1.5
    const challengePat = declassify(interact.getChallenge())
  })
  //code it 1.6
  Pat.publish(challengePat)
  commit()


  Vanna.only(() => {
    const challengeVanna = declassify(interact.getChallenge())
  })
  Vanna.publish(challengeVanna)
 commit()


  Bidder.only(() => {
    const price = declassify(interact.seePrice())
  })
  Bidder.publish(price)
  commit()


  Buyer.only(() => {
    const description = declassify(interact.getDescription)
  })
  Buyer.publish(description)
  commit()


})





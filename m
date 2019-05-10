From: walter harms <wharms@bfs.de>
Date: Fri, 10 May 2019 15:29:07 +0000
Subject: Re: [PATCH] mspro_block: Fix an error code in mspro_block_issue_req()
Message-Id: <5CD598C3.9090003@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190510112440.GA22858@mwanda>
In-Reply-To: <20190510112440.GA22858@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 10.05.2019 15:23, schrieb Dan Carpenter:
> On Fri, May 10, 2019 at 03:11:45PM +0200, walter harms wrote:
>> If i see this correcly everybody leaving the loop making the function return something.
>> I do not know how would do that but IMHO is better to be defensive and end the function
>> with a propper return code (perhaps 0).
>>
> 
> It's a forever loop.  If we add another break statement without adding
> at return then GCC will complain.
> 
> I feel like maybe you're saying that you don't like forever loops?  That
> becomes a pretty complicated position to take...
> 

No, not really,
but after several years of programming i have learned that forever() is never
forever and a break statement is easily added (in future).

Also it also looks strange to have a function returning int but the last thing
is not returning something.

just my 2 cents,

re,
 wh

ps: you could easily do
 	memstick_new_req(card->host);
  	break;
  }
return 0;

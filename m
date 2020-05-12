From: Peter Rosin <peda@axentia.se>
Date: Tue, 12 May 2020 14:40:57 +0000
Subject: Re: [PATCH] i2c: mux: demux-pinctrl: Fix an error handling path in 'i2c_demux_pinctrl_probe()'
Message-Id: <3e1f4c56-c590-8121-7129-9ebbf4db773d@axentia.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200506192100.194821-1-christophe.jaillet@wanadoo.fr>
 <20200512130802.GC13516@ninjato>
In-Reply-To: <20200512130802.GC13516@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: robh@kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2020-05-12 15:08, Wolfram Sang wrote:
> On Wed, May 06, 2020 at 09:21:00PM +0200, Christophe JAILLET wrote:
>> A call to 'i2c_demux_deactivate_master()' is missing in the error handling
>> path, as already done in the remove function.
>>
>> Fixes: 50a5ba876908 ("i2c: mux: demux-pinctrl: add driver")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Applied to for-current, thanks! Peter, I hope you are okay with me
> applying patches for my strange driver directly.

Absolutely, you have always "owned" that one. I prefer to stay out :-)

Cheers,
Peter

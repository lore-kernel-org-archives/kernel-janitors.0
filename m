From: Jakub Kicinski <kuba@kernel.org>
Date: Mon, 03 Feb 2020 17:38:14 +0000
Subject: Re: [PATCH] defxx: Fix a sentinel at the end of a 'eisa_device_id' structure
Message-Id: <20200203093814.69d33a2a@cakuba.hsd1.ca.comcast.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200202142341.22124-1-christophe.jaillet@wanadoo.fr>
        <20200203095553.GN1778@kadam>
        <alpine.LFD.2.21.2002031015530.752735@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.21.2002031015530.752735@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 3 Feb 2020 10:20:46 +0000 (GMT), Maciej W. Rozycki wrote:
>  Right, the code is good as it stands (I should have more faith in my past 
> achievements ;) ).  Except for the whitespace issue, which I suppose might 
> not be worth bothering to fix.  Thanks for your meticulousness!

For the white space clean up please resend after the merge window
(if you care), networking trees are only taking fixes fixes now :)

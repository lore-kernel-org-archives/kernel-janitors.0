From: Joe Perches <joe@perches.com>
Date: Sat, 11 Apr 2020 10:17:03 +0000
Subject: Re: [PATCH] checkpatch: check for missing \n at the end of logging message
Message-Id: <159680bb287fc43bb2129d3b731e15931bd9979c.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200407204908.10420-1-christophe.jaillet@wanadoo.fr>
         <8617a6b94c0644bce1fd4ca77309d67a612e6300.camel@perches.com>
         <6e52383e-100d-b016-32c2-6fb54938b6fe@wanadoo.fr>
         <c9fd4bc75812fed4799c2fb87b452b809a7e9a7a.camel@perches.com>
         <db2730700ab3eb7008413a1e7bba94ca7c49a031.camel@perches.com>
         <26b49cf5-453b-9a81-b045-fdc99c42fcf8@wanadoo.fr>
In-Reply-To: <26b49cf5-453b-9a81-b045-fdc99c42fcf8@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

On Sat, 2020-04-11 at 09:12 +0200, Christophe JAILLET wrote:
> 	./scripts/checkpatch.pl -f drivers/soc/kendryte/k210-sysctl.c
> 
> is missing line 189, even if it looks like a construction correctly spotted in some other files:
> 	if (foo) {
> 		dev_err(...);
> 		...
> 	};

Hi Christophe, many thanks for doing more testing

Are you sure about this one?  I get:

$ ./scripts/checkpatch.pl -f drivers/soc/kendryte/k210-sysctl.c
WARNING: Possible missing '\n' at the end of a logging message format string
#189: FILE: drivers/soc/kendryte/k210-sysctl.c:189:
+		dev_err(&pdev->dev, "failed to register clk");

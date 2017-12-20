From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 20 Dec 2017 21:20:36 +0000
Subject: Re: ps3: Improve a size determination in five functions
Message-Id: <2003adbe-1849-b689-40bf-00e02ae4e01e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9b6464bc-a408-de2a-1b54-cb7794b92506@users.sourceforge.net>
 <7aed1208-aa55-edb6-54be-f47fb1498bfd@users.sourceforge.net>
 <cd0c8519-85d0-0ce5-14a1-54a573234a98@infradead.org>
In-Reply-To: <cd0c8519-85d0-0ce5-14a1-54a573234a98@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Geoff Levand <geoff@infradead.org>, linuxppc-dev@lists.ozlabs.org
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> Some observations:
> 
>  o Your patch fixes no bug nor replaces any depreciated feature.

How do you think about information from the section “14) Allocating memory”
in the document “coding-style.rst” for the shown source code transformation?


>  o There will be no functional change; …

Yes. - The suggested adjustment should work in this way generally.

Regards,
Markus

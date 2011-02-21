From: Sergei Shtylyov <sshtylyov@mvista.com>
Date: Mon, 21 Feb 2011 15:31:15 +0000
Subject: Re: [PATCH] ata: sata_dwc_460ex: fix error path
Message-Id: <4D628543.5090700@mvista.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1284317830-5022-1-git-send-email-segooon@gmail.com> <4D5C1326.2010101@ru.mvista.com>
In-Reply-To: <4D5C1326.2010101@ru.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>, Jeff Garzik <jgarzik@pobox.com>
Cc: kernel-janitors@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Rupjyoti Sarmah <rsarmah@appliedmicro.com>, Prodyut Hazarika <phazarika@appliedmicro.com>, Grant Likely <grant.likely@secretlab.ca>, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org

Hello.

I wrote:

>> Free all allocated resources on error path.

>> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
>> ---
>>  I cannot compile this driver at all, so it is not tested.

>    I can at least compile-test the patch...

    No new errors/warnings are added by the patch.

WBR, Sergei

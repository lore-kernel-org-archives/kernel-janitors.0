From: Arend van Spriel <arend@broadcom.com>
Date: Wed, 03 Dec 2014 14:08:02 +0000
Subject: Re: [patch] CodingStyle: add some more error handling guidelines
Message-Id: <547F1942.5060502@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141202085950.GA13434@mwanda> <547F0297.6030202@users.sourceforge.net> <20141203124511.GR5048@mwanda> <547F0977.7090908@users.sourceforge.net> <20141203132002.GT5048@mwanda> <547F0F2A.3060708@users.sourceforge.net>
In-Reply-To: <547F0F2A.3060708@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Julia Lawall <julia.lawall@lip6.fr>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Coccinelle <cocci@systeme.lip6.fr>, backports@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, "Luis R. Rodriguez" <mcgrof@suse.com>

On 12/03/14 14:24, SF Markus Elfring wrote:
>> Sorry.  I misread your email.  If the code looks like this:
>>
>> 	foo = kmalloc();
>> 	if (!foo)
>> 		goto kmalloc_failed;
>>
>> The "kmalloc_failed" doesn't add any information.
>
> I find that this such a name approach would fit to your
> expectation of a source-oriented labeling of these identifiers.
>
>
>> We can see that kmalloc failed from the context.
>
> Which name pattern do you find more appropriate in such
> an use case?

I think Dan wants the label to be descriptive about the tasks needed in 
the exception handling itself. This makes sense as the exception 
handling steps may be reused for different failures in the code.

void foo(void)
{
	if (check_a())
		goto do_bar;

	sub_foo1();

	if (checck_b())
		goto do_bar;

	sub_foo2();
	return;

do_bar:
	bar();
}

Regards,
Arend

> Regards,
> Markus
> --
> To unsubscribe from this list: send the line "unsubscribe backports" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


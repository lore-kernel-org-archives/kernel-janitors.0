From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Tue, 02 Oct 2012 12:33:31 +0000
Subject: Re: [PATCH RFC] MAINTAINERS: Add section for subsystem shortname
Message-Id: <CA+MoWDqxXPiuFwmznynn8SPK20eJUgCKonq+C=s8fKvcnkb4Aw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1349179024-5319-1-git-send-email-peter.senna@gmail.com>
	<20121002121443.GT4587@mwanda>
In-Reply-To: <20121002121443.GT4587@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: joe@perches.com, gregkh@linuxfoundation.org, davem@davemloft.net, arnd@arndb.de, elezegarcia@gmail.com, Julia.Lawall@lip6.fr, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Oct 2, 2012 at 2:14 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Tue, Oct 02, 2012 at 01:57:04PM +0200, Peter Senna Tschudin wrote:
>> The shortname for a subsystem, that is primarly used when sending patches over E-mail, is not stored anywhere in the source code. Actually one need to dig git log or mailing list archives. There is no standard, and the Maintainer choose how to short name his/her subsystem. MAINTAINERS file is the right place for storing this information.
>>
>> U is the second letter of Subsystem.
>>
>> This will also enable automatic tools like scripts/get_maintainer.pl to provide the correct short name for each filename in the Kernel source tree.
>>
>
> This is pretty useless without a script to parse it.  Also none of
With or without a script, there is no default way of finding the short
name. Changing scripts/get_maintainer.pl to do it does not seems very
complex.

> subsystem names you chose as examples are correct.  Please line wrap
See? It's not easy to find three examples to put on the text. Can you
please provide three examples?

> your commit message at 72 characters.
Yes. I'll fix it.

Thank you,

Peter

>
> regards,
> dan carpenter
>



-- 
Peter

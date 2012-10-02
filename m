From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Tue, 02 Oct 2012 12:53:32 +0000
Subject: Re: [PATCH RFC] MAINTAINERS: Add section for subsystem shortname
Message-Id: <CA+MoWDoy+cqkzDHmR2=-3UhMn-i+fU0RVKwtkcsgRxOBk98oYA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1349179024-5319-1-git-send-email-peter.senna@gmail.com>
	<20121002121443.GT4587@mwanda>
	<CA+MoWDqxXPiuFwmznynn8SPK20eJUgCKonq+C=s8fKvcnkb4Aw@mail.gmail.com>
	<CALF0-+W25fAD0=kLD085G+H1b-WFaARudo-hkJO_LoBTNZC-Nw@mail.gmail.com>
In-Reply-To: <CALF0-+W25fAD0=kLD085G+H1b-WFaARudo-hkJO_LoBTNZC-Nw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ezequiel Garcia <elezegarcia@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, joe@perches.com, gregkh@linuxfoundation.org, davem@davemloft.net, arnd@arndb.de, Julia.Lawall@lip6.fr, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Oct 2, 2012 at 2:40 PM, Ezequiel Garcia <elezegarcia@gmail.com> wrote:
> On Tue, Oct 2, 2012 at 9:33 AM, Peter Senna Tschudin
> <peter.senna@gmail.com> wrote:
>> On Tue, Oct 2, 2012 at 2:14 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>>> On Tue, Oct 02, 2012 at 01:57:04PM +0200, Peter Senna Tschudin wrote:
>>>> The shortname for a subsystem, that is primarly used when sending patches over E-mail, is not stored anywhere in the source code. Actually one need to dig git log or mailing list archives. There is no standard, and the Maintainer choose how to short name his/her subsystem. MAINTAINERS file is the right place for storing this information.
>>>>
>>>> U is the second letter of Subsystem.
>>>>
>>>> This will also enable automatic tools like scripts/get_maintainer.pl to provide the correct short name for each filename in the Kernel source tree.
>>>>
>>>
>>> This is pretty useless without a script to parse it.  Also none of
>> With or without a script, there is no default way of finding the short
>> name. Changing scripts/get_maintainer.pl to do it does not seems very
>> complex.
>>
>
> Perhaps you should do get_maintainer.pl changes yourself and then
> use it to test on some of your patches to see what subject it produces.
What are your doubts about this method of getting the short name?

>
> Then it's easier to see if the proposal makes sense.
> A new rule / standard is something hard to push and we want to have as much
> facts as possible to make better decisions.
The fact is that currently there is no standard way of getting the
short name for a subsystem. My proposal fixes it allowing to look on
the MAINTAINERS file to see what short name to use.

>
> Thanks,
> Ezequiel.



-- 
Peter

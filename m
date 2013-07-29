From: Nicolas Palix <nicolas.palix@imag.fr>
Date: Mon, 29 Jul 2013 08:28:08 +0000
Subject: Re: Creating and sending patch without git (Sending As plain text)
Message-Id: <CAAxaTiMR2a8gTYq8rfbnzgb2Zo668GT_9utu4hRdLUoiVQ++Wg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <51EEDF14.3010906@gmail.com>
In-Reply-To: <51EEDF14.3010906@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi all,

Kumar, I think you should check the --depth option of git clone if
you're only interested in
sending patches.

--depth <depth>

Create a shallow clone with a history truncated to the specified
number of revisions. A shallow repository has a number of limitations
(you cannot clone or fetch from it, nor push from nor into it), but is
adequate if you are only interested in the recent history of a large
project with a long history, and would want to send in fixes as
patches.

Regards.


On Thu, Jul 25, 2013 at 1:45 PM, Peter Senna Tschudin
<peter.senna@gmail.com> wrote:
> On Tue, Jul 23, 2013 at 9:52 PM, Kumar Gaurav
> <kumargauravgupta3@gmail.com> wrote:
>> Hi Dan,
>>
>>
>> I have fixed several bugs in a program in staging and now want to send it to
>>
>> you before sending to maintainers. But currently i don't have git clone of
>>
>> current kernel. I had downloaded full tarball of 3.11-rc1 version.
>>
>>
>> So please tell me if there's a way to formate a mail and create a path for
>> the
>>
>> fix that i did. So that you can review my code.
>>
>>
>> Curently i'm cloning kernel using git but it seems like it'll take forever
>> as
>>
>> i dnt have very fast Internet connection speed and it seems to download
>> around
>>
>> 1200MB of data from last 2hr i've completed with just 5%. So let me know if
>>
>> there's way w/o git.
> You can create a git repository from the source code you've
> downloaded. See the steps:
>
> $ wget https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.10.2.tar.bz2
> $ tar xvjf linux-3.10.2.tar.bz2
> $ cd linux-3.10.2/
> $ git init
> $ git add *
> $ git commit -m 'initial commit'
>
> It is important to do the git commands 'before' doing any change to
> the source code. After creating the git repository, all git commands
> should work.
>
>>
>>
>> Regards
>>
>> Kumar Gaurav
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe kernel-janitors"
>> in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
> --
> Peter
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Nicolas Palix
Tel: +33 4 76 51 46 27
http://membres-liglab.imag.fr/palix/

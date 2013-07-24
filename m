From: Kumar Gaurav <kumargauravgupta3@gmail.com>
Date: Wed, 24 Jul 2013 06:52:07 +0000
Subject: Re: Creating and sending patch without git
Message-Id: <51EF76C7.5090103@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130723213741.GS5636@mwanda>
In-Reply-To: <20130723213741.GS5636@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wednesday 24 July 2013 03:07 AM, Dan Carpenter wrote:
> On Wed, Jul 24, 2013 at 01:18:48AM +0530, Kumar Gaurav wrote:
>> Hi Dan,
>>
>>
>> I have fixed several bugs in a program in staging and now want to
>> send it to
>>
>> you before sending to maintainers. But currently i don't have git clone of
>>
>> current kernel. I had downloaded full tarball of 3.11-rc1 version.
>>
>>
>> So please tell me if there's a way to formate a mail and create a
>> path for the
>>
>> fix that i did. So that you can review my code.
>>
> The old way of creating with diff a patch still works.  It is
> described in Documentation/SubmittingPatches.
>
> Mail the patch to yourself first.
> Save the emails as raw text including headers and everyting.
> cat email.txt | patch -p1
>
> Make sure that works before you send the patch.  Normally email
> clients mess everything up.  Mutt works by default but it's the
> only email client like that.  Refer to
> Documentation/email-clients.txt if you have problems.
>
> But you will find that very soon using the tar ball becomes too old.
>
> Btw, you may as well wait for git.  Don't rush in kernel devel work.
>
>> Curently i'm cloning kernel using git but it seems like it'll take
>> forever as
>>
>> i dnt have very fast Internet connection speed and it seems to
>> download around
>>
>> 1200MB of data from last 2hr i've completed with just 5%. So let me know if
>>
>> there's way w/o git.
> The problem as well with git is that if your connection drops in
> the middle then there is no way to recover so you have to restart.
>
> What I did was I had someone tar the .git directory and put it on
> a webpage so I could download it with wget which can recover from
> a failed connection.  It still ended up corrupted so I had to chop
> into into 1MB chunks on both sides, I ran md5sum on the chunks to
> see which one was corrrupted and then just downloaded the one I
> wanted.  "git clone" sucks for people with bad connections, but
> after you have the repository cloned then it's pretty great.
>
> regards,
> dan carpenter
Right now i have created a git repository with the tarball i had 
downloaded (main repository is still getting downloaded). I'm working 
using that. i hope it'll work well for me till git completes cloning the 
remote repository.
Thanks for your reply.

Regards
Kumar Gaurav

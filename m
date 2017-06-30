From: Paul Moore <paul@paul-moore.com>
Date: Fri, 30 Jun 2017 22:30:19 +0000
Subject: Re: [PATCH] selinux: return -ENOMEM if kzalloc() fails
Message-Id: <CAHC9VhTpBEJE3oYShNMNrLP7sL5hM2aSLDAcoLn0TMhpMma8Yg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170630075614.ywv3y3tptor5ox7g@mwanda>
	<1498826894.16913.1.camel@tycho.nsa.gov>
	<201706302210.GCA05089.MFFOtQVJSOLHOF@I-love.SAKURA.ne.jp>
In-Reply-To: <201706302210.GCA05089.MFFOtQVJSOLHOF@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org

On Fri, Jun 30, 2017 at 9:10 AM, Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
> Stephen Smalley wrote:
>> On Fri, 2017-06-30 at 10:56 +0300, Dan Carpenter wrote:
>> > We accidentally return success instead of -ENOMEM on this failure
>> > path.
>> >
>> > Fixes: 409dcf31538a ("selinux: Add a cache for quicker retreival of
>> > PKey SIDs")
>> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> NAK, that's intentional.  See the comment just above the code in
>> question.
>
> If allocation failure is no problem, please consider using
> GFP_NOWAIT | __GFP_NOMEMALLOC | __GFP_NOWARN instead of
> GFP_ATOMIC, for memory reserves is mainly targeted for OOM victims.

I have a todo item to try and consolidate some of the SELinux object
cache code, this seems like something worth experimenting with when
that happens.

-- 
paul moore
www.paul-moore.com

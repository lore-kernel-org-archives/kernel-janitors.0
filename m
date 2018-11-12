From: Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 12 Nov 2018 12:57:22 +0000
Subject: Re: [PATCH] Documentation: fix spelling mistake, EACCESS -> EACCES
Message-Id: <87bm6ua1xp.fsf@concordia.ellerman.id.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181026172549.3628-1-colin.king@canonical.com> <20181107153104.71eddf4d@lwn.net> <d1048515-239a-2686-e897-fb2a2b8d180f@ozlabs.org>
In-Reply-To: <d1048515-239a-2686-e897-fb2a2b8d180f@ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Kerr <jk@ozlabs.org>, Jonathan Corbet <corbet@lwn.net>, Colin King <colin.king@canonical.com>, Geoff Levand <geoff@infradead.org>
Cc: David Airlie <airlied@linux.ie>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.orglinuxppc-dev@lists.ozlabs.org

Jeremy Kerr <jk@ozlabs.org> writes:
> Hi Jon,
>
>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>> ---
>>>   Documentation/filesystems/spufs.txt | 2 +-
>>>   Documentation/gpu/drm-uapi.rst      | 4 ++--
>>>   2 files changed, 3 insertions(+), 3 deletions(-)
>> 
>> Applied, thanks.
>> 
>> This is the first patch to spufs.txt since 2006...I wonder if that stuff
>> is being used by anybody...
>
> Anyone who is using the vector processors on the Cell BE processors will
> be using it. However, that hardware is becoming pretty rare now.
>
> We'll want to remove the spufs bits if/when we drop support for the cell
> platforms (IBM QSxx, PS3, celleb). mpe: any ides on that? Do you have a 
> policy for dropping platform support?

I don't have a policy. We discussed it a bit at maintainer summit, that
basically boiled down to stuff should get removed when it is not used
much and/or is causing undue maintenance burden - both of which are
fairly arbitrary criteria.

My feeling is spufs is not causing anyone much work, it does get hit by
some VFS updates but it's just one of many many filesystems, so the
incremental overhead is pretty small I think - though VFS people may
disagree :)

I still have a working IBM QS22, and Geoff is still maintaining PS3,
celleb is gone.

Basically we're keeping it around in case people are still using it on
their PS3s. I don't know how we gauge how many people that is without
removing support and seeing who is annoyed. But even if we did that a
lot of folks will probably not notice for months to years, and when they
do notice they'll just bin their PS3s rather than telling us.

But maybe Geoff has a better feel for how many people (other than him)
are still running upstream on PS3s.

cheers

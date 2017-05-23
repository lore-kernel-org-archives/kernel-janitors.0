From: Jani Nikula <jani.nikula@linux.intel.com>
Date: Tue, 23 May 2017 08:19:58 +0000
Subject: Re: [PATCH][drm-next] drm/pl111: make structure pl111_display_funcs static
Message-Id: <871srgouhd.fsf@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170519110203.19417-1-colin.king@canonical.com>
 <874lwhoxyk.fsf@intel.com> <20170519194759.gfiefx6xwrnrjn3x@mwanda>
 <874lwg8v9n.fsf@eliezer.anholt.net> <20170519201641.fwnoakx5gew7wo5t@mwanda>
In-Reply-To: <20170519201641.fwnoakx5gew7wo5t@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Eric Anholt <eric@anholt.net>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Colin King <colin.king@canonical.com>

On Fri, 19 May 2017, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Fri, May 19, 2017 at 01:08:20PM -0700, Eric Anholt wrote:
>> OK, that's definitely not how I've read the
>> Documentation/process/submitting-patches.rst description of the Fixes
>> tag, which talks about bugs found with git bisect and things that should
>> go to -stable.  I would not have considered what this patch is changing
>> to be a bug.
>
> True.  I don't consider this a bug either.  I wouldn't have included a
> Fixes tag.
>
> I pretty much agree with the submitting-patches.rst except it should
> probably say to include it on more stuff.  Fixes: tags are required for
> all bugfixes to netdev for example.

We use Fixes: in drm/i915 to basically indicate that the referenced
commit has a bug that actually needs to be fixed, this patch is the fix,
and should go wherever the referenced commit goes. Annotating typo fixes
and missing static keywords and such is just noise from *our* POV, and
need to be filtered out.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Technology Center

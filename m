From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 14 Mar 2016 10:58:13 +0000
Subject: Re: [patch] kexec: potetially using uninitialized variable
Message-Id: <20160314105813.GL5273@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160311080747.GA31887@mwanda>
 <56E2875B.8010909@redhat.com>
 <20160311091919.GD5273@mwanda>
 <56E2944E.3030204@bfs.de>
 <20160311153819.GA14320@mhuang-ThinkPad-T440s>
In-Reply-To: <20160311153819.GA14320@mhuang-ThinkPad-T440s>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Minfei Huang <mnfhuang@gmail.com>
Cc: walter harms <wharms@bfs.de>, xlpang@redhat.com, Andrew Morton <akpm@linux-foundation.org>, Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>, Ingo Molnar <mingo@kernel.org>, Toshi Kani <toshi.kani@hpe.com>, Mimi Zohar <zohar@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Mar 11, 2016 at 11:38:19PM +0800, Minfei Huang wrote:
> I think we can modify the logic a bit to make code simple. Thus gcc will
> not complain about any more, and the logic is earier.

This is a Smatch warning, not a GCC warning.  If you think the new code
is clearer, that's fine but don't just silence the warning to please
Smatch.  I'm pretty sure I can silence this warning in Smatch.

regards,
dan carpenter


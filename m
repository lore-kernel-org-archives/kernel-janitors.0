From: "Drokin, Oleg" <oleg.drokin@intel.com>
Date: Wed, 10 Sep 2014 14:52:47 +0000
Subject: Re: [PATCH] checkpatch: Warn on macros with flow control statements
Message-Id: <7058A061-03C6-4C09-9A82-5F4DADB0FA01@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1410106715-9573-6-git-send-email-Julia.Lawall@lip6.fr>
 <20140909125410.GJ6549@mwanda> <1410295093.12560.60.camel@joe-AO725>
 <20140910084306.GV6600@mwanda> <1410357331.24028.39.camel@joe-AO725>
 <alpine.DEB.2.10.1409101604210.4747@hadrien>
 <1410359800.24028.51.camel@joe-AO725>
In-Reply-To: <1410359800.24028.51.camel@joe-AO725>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Dan Carpenter <dan.carpenter@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, "<devel@driverdev.osuosl.org>" <devel@driverdev.osuosl.org>, "Dilger, Andreas" <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peng Tao <bergwolf@gmail.com>, "<kernel-janitors@vger.kernel.org>" <kernel-janitors@vger.kernel.org>, "<linux-kernel@vger.kernel.org>" <linux-kernel@vger.kernel.org>, Andy Whitcroft <apw@canonical.com>

Hello!

On Sep 10, 2014, at 10:36 AM, Joe Perches wrote:

> On Wed, 2014-09-10 at 16:06 +0200, Julia Lawall wrote:
>> On Wed, 10 Sep 2014, Joe Perches wrote:
>>> On Wed, 2014-09-10 at 11:43 +0300, Dan Carpenter wrote:
>>>> On Tue, Sep 09, 2014 at 01:38:13PM -0700, Joe Perches wrote:
>>>>> Macros with flow control statements (goto and return) are
>>>>> not very nice to read as any flow movement is unexpected.
>>> 
>>> break and continue are also flow control statements
>>> but are those are frequently used in macros in
>>> complete switch statements so were not added.
>> 
>> Would it be possible to make a warning when there is a break or continue
>> but no while/switch/etc.
> 
> I suppose the has_flow_statement could be extended.
> 
> Maybe something like:
> 
> 			if ($ctx =~ /\b(goto|return|break|continue)\b/ &&
> 			    $ctx !~ /\b(switch|if|do|while)\b/) {
> 				has_flow_statement = 1;
> 			}
> 
> but checkpatch isn't really capable  of doing proper
> flow logic analysis.

While possibly not really suitable in checkpatch, it might be a good addition to
some static code analyzer as a "future bugs possible due to this" check.

Bye,
    Oleg
From: Sam Leffler <sleffler@chromium.org>
Date: Thu, 18 Oct 2012 00:07:07 +0000
Subject: Re: [mac80211-next:wip 19/37] include/uapi/linux/nl80211.h:3101:1: error: expected identifier before
Message-Id: <CA+yqC4a6qYpEUho15JGkb82=+XPWvEOXc+biXBiTnFy8PqUfkg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <507ebd61.LoCS32J+GZFlvQsJ%fengguang.wu@intel.com>
In-Reply-To: <507ebd61.LoCS32J+GZFlvQsJ%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Oct 17, 2012 at 4:53 PM, Bing Zhao <bzhao@marvell.com> wrote:
> Hi Fengguang,
>
>> > This commit is the first patch (1/5) of "add scan flags support" series.
>> > It adds a placeholder for nl80211_scan_flags. 3/5 and 4/5 add actual flags to it.
>>
>> But that placeholder is not a valid C construct and breaks kernel build ..
>>
>> > So, you have to get the whole patchset to compile.
>>
>> When preparing/organizing patches, every step of the patchset should
>> be able to build and boot fine. That will make it friendly to bisect.
>
> That's a good point. Thanks!

Hmm, the original patch series was build-tested for this reason;
sounds like there's a difference in compiler switches.  But regardless
I defer to Bing.

>
>
> Hi Johannes,
>
> Do you want me to respin this series or you will do it?
>
> Thanks,
> Bing
>

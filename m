From: Jonathan Cameron <jic23@jic23.retrosnub.co.uk>
Date: Mon, 05 Feb 2018 21:51:44 +0000
Subject: Re: hid-sensor-accel-3d: Delete an error message for a failed memory allocation in hid_accel_3d_prob
Message-Id: <87DF341A-1356-4B1B-8D25-14D5B0AAB01D@jic23.retrosnub.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0406765c-bdd1-1a82-cf66-1c248063ae4f@users.sourceforge.net> <20180204112346.0977e938@archlinux> <9420fc82-1a37-3601-bafe-f57ef953bfcd@users.sourceforge.net>
In-Reply-To: <9420fc82-1a37-3601-bafe-f57ef953bfcd@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, linux-input@vger.kernel.org
Cc: Hartmut Knaack <knaack.h@gmx.de>, Jiri Kosina <jikos@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org



On 5 February 2018 18:26:59 GMT, SF Markus Elfring <elfring@users.sourceforge.net> wrote:
>> If making changes like this I would suggest only sending one until
>> you have have a response from the relevant maintainer.
>
>The corresponding feedback can become more positive for such
>a transformation pattern after a while, can't it?

Not in that sort of time period.
>
>
>> It would save you time as often these sorts of changes are
>> a matter of personal taste and weighing up of costs vs gains
>> - hence it is not obvious that they will be accepted.
>
>Can the wording “WARNING: Possible unnecessary 'out of memory' message”
>(from the script “checkpatch.pl”) be another incentive?

No. The key word is possible. Check patch is dumb and often gives false positives.
>
>Regards,
>Markus

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.

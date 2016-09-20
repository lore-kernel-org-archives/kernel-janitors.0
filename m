From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 20 Sep 2016 11:03:06 +0000
Subject: Re: GPU-DRM-GMA500: One error message less for a GCT revision mismatch in mid_get_vbt_data()
Message-Id: <0248eabf-9b9e-e43d-0ea4-63d1cad626c0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <3c9785ef-4553-2e3d-2cb2-5cf6d1f31ccd@users.sourceforge.net>
 <287833f5-f1ad-b7f0-c614-d4c903b1c890@users.sourceforge.net>
 <87shsulw9k.fsf@intel.com> <20160920104855.GJ13620@mwanda>
In-Reply-To: <20160920104855.GJ13620@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Julia Lawall <julia.lawall@lip6.fr>

>>> A single error message should be sufficient to inform about
>>> the detection of an unknown GCT revision at the end.
>>> Thus return after the logging call in this case directly.
>>
>> Did you test this?
>>
> 
> Don't be a dummy...  This is easy to review an it fixes a bug.

Thanks for this kind of constructive feedback.


> I'm fine with you NAKing all these patches based on who they are from.

Would you like to clarify such an information a bit more?


> I mostly just delete these without responding because the guy has
> history of introducing bugs and never listens to feedback.

I admit that I'll stumble on programming mistakes again occasionally
as another ordinary free software developer who is struggling various open issues.

I am listening to various feedback. My responses might not be pleasing enough
for you. Are you looking for any special information to improve
a corresponding discussion?

Regards,
Markus

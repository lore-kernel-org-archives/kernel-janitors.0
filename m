From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 06 Oct 2019 05:39:30 +0000
Subject: Re: staging: vt6655: Fix memory leak in vt6655_probe
Message-Id: <ea5e4945-b48f-0955-ba52-071ef1bb0e57@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191004200319.22394-1-navid.emamdoost@gmail.com>
 <1d0ba4c6-99ed-e2c9-48a2-ce34b0042876@web.de>
 <20191005184035.GA2062613@kroah.com>
In-Reply-To: <20191005184035.GA2062613@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Navid Emamdoost <navid.emamdoost@gmail.com>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org
Cc: Malcolm Priestley <tvboxspy@gmail.com>, Kangjie Lu <kjlu@umn.edu>, linux-kernel@vger.kernel.org, Madhumitha Prabakaran <madhumithabiw@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>, Navid Emamdoost <emamd001@umn.edu>, Forest Bond <forest@alittletooquiet.net>, Stephen McCamant <smccaman@umn.edu>

>>> In vt6655_probe, if vnt_init() fails the cleanup code needs to be called
>>> like other error handling cases. The call to device_free_info() is
>>> added.
>>
>> Please improve this change description.
>
> It is fine as-is, please do not confuse people.

Would you like to clarify a known guideline once more?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=43b815c6a8e7dbccb5b8bd9c4b099c24bc22d135#n151
“…
Describe your changes in imperative mood,
…”

Regards,
Markus

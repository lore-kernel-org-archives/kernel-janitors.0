From: Hans Verkuil <hverkuil@xs4all.nl>
Date: Sat, 23 Sep 2017 07:35:31 +0000
Subject: Re: [PATCH 0/8] [media] v4l2-core: Fine-tuning for some function implementations
Message-Id: <f48e9219-3092-1b1f-4458-f9437746bf14@xs4all.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9268b60d-08ba-c64e-1848-f84679d64f80@users.sourceforge.net>
 <20161227115111.GN16630@valkosipuli.retiisi.org.uk>
 <b804f4dd-392e-ae8e-41de-a02260fef550@xs4all.nl>
 <8241c145-03f4-6dd2-401e-7d251cd5d251@users.sourceforge.net>
In-Reply-To: <8241c145-03f4-6dd2-401e-7d251cd5d251@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>, linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>, Dave Hansen <dave.hansen@linux.intel.com>, Jan Kara <jack@suse.cz>, Javier Martinez Canillas <javier@osg.samsung.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Lorenzo Stoakes <lstoakes@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Michal Hocko <mhocko@suse.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 22/09/17 22:08, SF Markus Elfring wrote:
>> Sorry Markus, just stay away from the videobuf-* sources.
>=20
> Will the software evolution be continued for related source files?
> Are there any update candidates left over in the directory =93v4l2-core=
=94?

Sorry, I don't understand the question. We don't want to touch the
videobuf-* files unless there is a very good reason. That old videobuf
framework is deprecated and the code is quite fragile (i.e. easy to break
things).

Everything else in that directory is under continuous development.

It's core code though, so it gets a much more in-depth code review than
patches for e.g. a driver.

Regards,

	Hans
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

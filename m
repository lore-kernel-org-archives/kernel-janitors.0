From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 23 Sep 2017 15:27:10 +0000
Subject: Re: [media] v4l2-core: Fine-tuning for some function implementations
Message-Id: <85cf0892-68d4-560e-58df-874148d82143@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9268b60d-08ba-c64e-1848-f84679d64f80@users.sourceforge.net>
 <20161227115111.GN16630@valkosipuli.retiisi.org.uk>
 <b804f4dd-392e-ae8e-41de-a02260fef550@xs4all.nl>
 <8241c145-03f4-6dd2-401e-7d251cd5d251@users.sourceforge.net>
 <f48e9219-3092-1b1f-4458-f9437746bf14@xs4all.nl>
In-Reply-To: <f48e9219-3092-1b1f-4458-f9437746bf14@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>, Dave Hansen <dave.hansen@linux.intel.com>, Jan Kara <jack@suse.cz>, Javier Martinez Canillas <javier@osg.samsung.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Lorenzo Stoakes <lstoakes@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Michal Hocko <mhocko@suse.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> Will the software evolution be continued for related source files?
>> Are there any update candidates left over in the directory =93v4l2-core=
=94?
>=20
> Sorry, I don't understand the question.

I try to explain my view again.


> We don't want to touch the videobuf-* files unless there is a very good r=
eason.

I hoped that my update suggestions could be good enough once more for this =
area.


> That old videobuf framework is deprecated and the code is quite fragile
> (i.e. easy to break things).

How do you think about to move this stuff into a separate subdirectory
so that it might become a bit easier to distinguish these software componen=
ts?


> Everything else in that directory is under continuous development.

I am curious if there are still update candidates left over
(also from my selection of change possibilities).

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

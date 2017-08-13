From: "Serge E. Hallyn" <serge@hallyn.com>
Date: Sun, 13 Aug 2017 16:24:14 +0000
Subject: Re: [PATCH 1/4] selinux: Delete eight unnecessary variable assignments
Message-Id: <20170813162414.GC4515@mail.hallyn.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e9f47cc9-fda7-dc54-bca9-cae6488914e0@users.sourceforge.net>
	<05edc763-dddd-fe48-b98c-21e4ad5463a3@users.sourceforge.net>
	<20170813162233.GB4515@mail.hallyn.com>
In-Reply-To: <20170813162233.GB4515@mail.hallyn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org

Quoting Serge E. Hallyn (serge@hallyn.com):
> Quoting SF Markus Elfring (elfring@users.sourceforge.net):
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Sun, 13 Aug 2017 14:17:48 +0200
> > 
> > One local variable was reset to zero at the end of these functions.
> > This value will also be set by a previous call of a function if it was
> > executed successfully. Thus omit an extra assignment there.
> > 
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> 
> Acked-by: Serge Hallyn <serge@hallyn.com>

BTW this does add a burden to the maintainers as it makes the
code a bit more fragile in the face of future changes.  So my
ack means it looks ok, but if the maintainers don't want to take
it I absolutely understand.

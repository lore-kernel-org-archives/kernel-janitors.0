From: "Serge E. Hallyn" <serge@hallyn.com>
Date: Sun, 13 Aug 2017 16:24:34 +0000
Subject: Re: [PATCH 2/4] selinux: Adjust jump targets in ebitmap_read()
Message-Id: <20170813162434.GD4515@mail.hallyn.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e9f47cc9-fda7-dc54-bca9-cae6488914e0@users.sourceforge.net>
	<2c4582c9-efc1-4b8c-1095-84e00062c7de@users.sourceforge.net>
In-Reply-To: <2c4582c9-efc1-4b8c-1095-84e00062c7de@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org

Quoting SF Markus Elfring (elfring@users.sourceforge.net):
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 13 Aug 2017 15:21:43 +0200
> 
> Adjust jump targets so that the function implementation becomes smaller.

By how much?

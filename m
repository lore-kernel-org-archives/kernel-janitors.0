From: Robin Holt <robinmholt@gmail.com>
Date: Thu, 11 Jan 2018 18:19:37 +0000
Subject: Re: [PATCH 0/3] SGI-XPC: Adjustments for some function implementations
Message-Id: <CAPp3RGoGnPegWSEQUd-m=-Mf3wtAYL6YNwFR7Cpw_s_8AwOEEA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cf88f891-5960-ff01-b8b5-b8194ceff4f1@users.sourceforge.net>
In-Reply-To: <cf88f891-5960-ff01-b8b5-b8194ceff4f1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>

If you need to resubmit, please consider re-ordering the changes to
due the comparison to NULL changes in your first patch, followed by the
other two in either order.  I think it will clear up some of the inconsistency
in your first patch.

Thanks,
Robin

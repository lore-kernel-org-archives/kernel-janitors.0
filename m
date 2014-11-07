From: Greg KH <gregkh@linuxfoundation.org>
Date: Fri, 07 Nov 2014 21:41:00 +0000
Subject: Re: [PATCH] Replace mentions of "list_struct" to "list_head"
Message-Id: <20141107214100.GA1640@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1415395128-7976-1-git-send-email-andrey.krieger.utkin@gmail.com>
In-Reply-To: <1415395128-7976-1-git-send-email-andrey.krieger.utkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Cc: shuah.kh@samsung.com, kenhelias@firemail.de, kernel-janitors@vger.kernel.org, valentina.manea.m@gmail.com, dri-devel@lists.freedesktop.org, oleg@redhat.com, mgorman@suse.de, paulmck@linux.vnet.ibm.com, jeffrey.t.kirsher@intel.com, linux-kbuild@vger.kernel.org, josh@joshtriplett.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com, yann.morin.1998@free.fr, ddstreet@ieee.org, awalls@md.metrocast.net, laijs@cn.fujitsu.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, yamada.m@jp.panasonic.com, alexander.deucher@amd.com, akpm@linux-foundation.org, linux-media@vger.kernel.org, christian.koenig@amd.com, m.chehab@samsung.com

On Sat, Nov 08, 2014 at 01:18:48AM +0400, Andrey Utkin wrote:
> There's no such thing as "list_struct".
> 
> Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
> ---
>  drivers/gpu/drm/radeon/mkregtable.c  | 24 ++++++++++++------------
>  drivers/media/pci/cx18/cx18-driver.h |  2 +-
>  include/linux/list.h                 | 34 +++++++++++++++++-----------------
>  include/linux/plist.h                | 10 +++++-----
>  include/linux/rculist.h              |  8 ++++----
>  scripts/kconfig/list.h               |  6 +++---
>  tools/usb/usbip/libsrc/list.h        |  2 +-
>  7 files changed, 43 insertions(+), 43 deletions(-)

Stuff like this should be sent to the trivial maintainer...

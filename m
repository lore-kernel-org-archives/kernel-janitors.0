From: Alan Cox <alan@linux.intel.com>
Date: Fri, 24 Aug 2012 10:17:26 +0000
Subject: Re: [PATCH] gma500: remove references to drm_display_info raw_edid field
Message-Id: <20120824111726.79f39143@bob.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120824001212.GC25618@localhost>
	<1345790564-21095-1-git-send-email-jani.nikula@intel.com>
In-Reply-To: <1345790564-21095-1-git-send-email-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@intel.com>
Cc: airlied@redhat.com, fengguang.wu@intel.com, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Fri, 24 Aug 2012 09:42:44 +0300
Jani Nikula <jani.nikula@intel.com> wrote:

> Another reference to raw_edid field of struct drm_display_info was
> added in gma500 while the whole field was being removed, causing build
> failure. Remove the hopefully last references to raw_edid.
> 
> Reported-by: Fengguang Wu <fengguang.wu@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Signed-off-by: Alan Cox <alan@linux.intel.com>

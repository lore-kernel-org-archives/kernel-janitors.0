From: Michal Marek <mmarek@suse.cz>
Date: Thu, 25 Nov 2010 14:59:53 +0000
Subject: Re: [PATCH] scripts/checkpatch.pl: add ata_port_operations to the
Message-Id: <4CEE79E9.1060204@suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <684104.78681.qm@smtp127.mail.ukl.yahoo.com>
In-Reply-To: <684104.78681.qm@smtp127.mail.ukl.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lionel Debroux <lionel_debroux@yahoo.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>

Added Andy and Joe to CC. Lionel, you should consult the MAINTAINERS
file and/or the get_maintainer.pl script and/or the git history to find
suitable addresses to CC.

Michal

On 8.11.2010 07:29, Lionel Debroux wrote:
> Patch against mainline.
> 
> ---
> 
> Subject: [PATCH] scripts/checkpatch.pl: add ata_port_operations to the list of ops that ought to be const.
> 
> I noticed that many ata_port_operations instances are constified
> by the grsecurity patch, so it may be desirable to reduce the
> introduction of non-const instances through checkpatch.pl.
> 
> Signed-off-by: Lionel Debroux <lionel_debroux@yahoo.fr>
> ---
>  scripts/checkpatch.pl |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index e3c7fc0..33fab2e 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2810,6 +2810,7 @@ sub process {
>  # check for various ops structs, ensure they are const.
>  		my $struct_ops = qr{acpi_dock_ops|
>  				address_space_operations|
> +				ata_port_operations|
>  				backlight_ops|
>  				block_device_operations|
>  				dentry_operations|


From: Sakari Ailus <sakari.ailus@iki.fi>
Date: Thu, 20 Jul 2017 13:32:59 +0000
Subject: Re: [PATCH][media-next] media: v4l: make local function v4l2_fwnode_endpoint_parse_csi1_bus static
Message-Id: <20170720133258.s4yvdygcav4i4m6z@valkosipuli.retiisi.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170720103014.19545-1-colin.king@canonical.com>
In-Reply-To: <20170720103014.19545-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Sebastian Reichel <sre@kernel.org>, Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jul 20, 2017 at 11:30:14AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The function v4l2_fwnode_endpoint_parse_csi1_bus does not need to be
> in global scope, so make it static.  Also reformat the function arguments
> as adding the static keyword made one of the source lines more than 80
> chars wide and checkpatch does not like that.
> 
> Cleans up sparse warning:
> "symbol 'v4l2_fwnode_endpoint_parse_csi1_bus' was not declared. Should it
> be static?"
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks!

Applied, with removal of an extra neline and a tab in the arguments.

-- 
Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk

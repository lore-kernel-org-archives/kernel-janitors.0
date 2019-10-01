From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 01 Oct 2019 08:30:44 +0000
Subject: Re: [PATCH v2] fs: affs: fix a memory leak in affs_remount
Message-Id: <44ad775e-3b6f-4cbc-ba6f-455ff7191c58@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ec7d3fdb-445b-7f4e-d6e6-77c6ae9a5732@web.de>
 <20190930210114.6557-1-navid.emamdoost@gmail.com>
In-Reply-To: <20190930210114.6557-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, linux-fsdevel@vger.kernel.org
Cc: Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Kangjie Lu <kjlu@umn.edu>, David Sterba <dsterba@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Al Viro <viro@zeniv.linux.org.uk>, Jeff Layton <jlayton@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Deepa Dinamani <deepa.kernel@gmail.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> The allocated memory for new_opts is only released if pare_options fail.

Can the following wording be nicer?

  The allocated memory for the buffer “new_opts” will be released
  only if a call of the function “parse_options” failed.


> The release for new_opts is added.

* How do you think about the change possibility to delete questionable
  source code here?

* Would you like to complete the data processing for corresponding options
  any more?


> 	-- fix a type in title, …

Please avoid typos also in your version comments.


> ---

I suggest to replace this second delimiter by a blank line.

Regards,
Markus

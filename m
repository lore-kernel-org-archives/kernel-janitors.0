From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Oct 2011 22:28:05 +0000
Subject: Re: [patch] memory hotplug: release lock on an error path
Message-Id: <20111018222805.GB24215@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111005055326.GA32187@elgon.mountain>
 <20111018212931.GB10656@tiehlicka.suse.cz>
In-Reply-To: <20111018212931.GB10656@tiehlicka.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Hocko <mhocko@suse.cz>
Cc: Nathan Fontenot <nfont@austin.ibm.com>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, kernel-janitors@vger.kernel.org

On Tue, Oct 18, 2011 at 02:29:32PM -0700, Michal Hocko wrote:
> On Wed 05-10-11 08:53:26, Dan Carpenter wrote:
> > We need to release the mutex here before returning.
> 
> Which kernel have you used as a base? I do not see any code like that in
> the vanilla kernel. And git log doesn't know anything about
> check_page_reservations in the file as well...
> 

Sorry this was against linux-next.

regards,
dan carpenter


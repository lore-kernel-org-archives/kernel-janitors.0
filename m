From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sun, 03 May 2015 18:15:33 +0000
Subject: Re: [RFC PATCH 0/3] Moving lustre procfs stuff to sysfs & questions.
Message-Id: <20150503181533.GD24370@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430622608-30402-1-git-send-email-green@linuxhacker.ru>
In-Reply-To: <1430622608-30402-1-git-send-email-green@linuxhacker.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, May 02, 2015 at 11:10:05PM -0400, green@linuxhacker.ru wrote:
> From: Oleg Drokin <green@linuxhacker.ru>
> 
> Greg, I wonder if you can take at least a brief look and tell me if this
> is the direction you were envisioning wrt this particular cleanup.
> 
> It's not all-inclusive, but I have a long flight tomorrow so
> if the direction is right, I can convert more of this stuff.
> 
> This does not touch some of the multi-value stuff that would probably
> need to move to debugfs or other places, that would be a next step.
> 
> Additionally some questions:
> I know sysfs is supposedly 1 file 1 value, though I see some exceptions, e.g.:
> # cat /sys/kernel/vmcoreinfo 
> 2b57500 1024
> 
> So we have this /proc/fs/lustre/devices that prints status of all
> "lustre internal devices (or obd for short)" like this:
> # cat /proc/fs/lustre/devices 
>   0 UP mgc MGC192.168.10.226@tcp d6815182-b36d-c4ba-6aa6-065aeb9e9769 5
>   1 UP lov lustre-clilov-ffff8800bd617800 32be3f55-891e-ed82-cae9-6add0770d503 4
> ...
> 
> Obviously I cannot retain it as a single file, but do I really need to
> create a tree that would look like:
> /sys/fs/lustre/obd/[1...]/{status,name,type,uuid,refcount}
> (or possibly even /sys/devices/virtual/lustre_obd/... )
> or can I get away with just
> /sys/fs/lustre/obd/[1...] files where there's one line per obd like:
>   0 UP mgc MGC192.168.10.226@tcp d6815182-b36d-c4ba-6aa6-065aeb9e9769 5
> (frankly, I have not figured out yet how to dynamically add files
> to sysfs dir).

Either make a tree of kobjects, or individual files, but not one big
file, that's not acceptable for sysfs, sorry.

> What about /proc/sys stuff - /proc/sys/lustre and /proc/sys/lnet?
> Hopefully it's ok to leave those where they are?

Nope, please remove.  If you aren't a process value, you can't add new
proc files.

> Also I found that cgroup does calls into kernfs directly, gaining
> ability to register seq_file files and otherwise do all sorts of
> stuff that would be cool to do from lustre too ;)

If you want to make lustrefs, be my guest, you can do whatever you want
in that, using kernfs, but that's not ok for sysfs, sorry.

thanks,

greg k-h

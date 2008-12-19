From: Julia Lawall <julia@diku.dk>
Date: Fri, 19 Dec 2008 17:56:46 +0000
Subject: container_of
Message-Id: <Pine.LNX.4.64.0812191854150.11217@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Considering code such as the following (drivers/acpi/osl.c):

 	struct acpi_os_dpc *dpc = container_of(work, struct acpi_os_dpc, work);
	if (!dpc) {
 		printk(KERN_ERR PREFIX "Invalid (NULL) context\n");
 		return;
 	}

Is it very likely that container_of can return NULL?  Container_of 
computes an offset from a pointer, so I have the impression that if given 
a NULL value it would normally return a negative number (or a very large 
positive one, depending on how it is interpreted).

thanks,
julia

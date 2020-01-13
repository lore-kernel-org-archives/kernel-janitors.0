From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 13 Jan 2020 13:06:17 +0000
Subject: [bug report] bpf: Introduce BPF_MAP_TYPE_STRUCT_OPS
Message-Id: <20200113130617.7ecdrglwlmofhvrx@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Martin KaFai Lau,

The patch 85d33df357b6: "bpf: Introduce BPF_MAP_TYPE_STRUCT_OPS" from
Jan 8, 2020, leads to the following static checker warning:

	kernel/bpf/bpf_struct_ops.c:501 bpf_struct_ops_map_seq_show_elem()
	warn: 'value' is an error pointer or valid

kernel/bpf/bpf_struct_ops.c
   495  static void bpf_struct_ops_map_seq_show_elem(struct bpf_map *map, void *key,
   496                                               struct seq_file *m)
   497  {
   498          void *value;
   499  
   500          value = bpf_struct_ops_map_lookup_elem(map, key);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is just a dummy function that only returns -EINVAL.

   501          if (!value)
   502                  return;
   503  
   504          btf_type_seq_show(btf_vmlinux, map->btf_vmlinux_value_type_id,
   505                            value, m);
   506          seq_puts(m, "\n");
   507  }


regards,
dan carpenter

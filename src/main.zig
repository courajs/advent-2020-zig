const std = @import("std");
const fs = std.fs;

pub fn main() anyerror!void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    var alloc = &gpa.allocator;

    var inputs = try fs.cwd().openDir("inputs", .{});
    var three = try inputs.openFile("3.txt", .{});
    var bytes = three.readToEndAlloc(alloc, 100000);

    std.log.info("{s}", .{bytes});
}

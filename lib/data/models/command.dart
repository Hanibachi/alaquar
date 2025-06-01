import 'package:alaquar/data/utilities/enums/command_arguments.dart';
import 'package:alaquar/data/utilities/enums/order.dart';
import 'package:dart_mappable/dart_mappable.dart';
part 'command.mapper.dart';

@MappableClass()
class Command with CommandMappable {
  final Order order;
  final Map<CommandArgument, dynamic> arguments;

  Command(this.order, this.arguments);
}

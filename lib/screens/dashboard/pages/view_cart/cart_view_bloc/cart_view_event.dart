part of 'cart_view_bloc.dart';

@immutable
sealed class CartViewEvent {}

class ShowCartDataEvent extends CartViewEvent{}
